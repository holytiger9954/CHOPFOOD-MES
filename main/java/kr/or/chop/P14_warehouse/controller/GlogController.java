package kr.or.chop.P14_warehouse.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P14_warehouse.service.WHService;
import kr.or.chop.P15_workplace.service.GlogService;
import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;

@Controller
@RequestMapping("/warehouse/glog")
public class GlogController {

	@Autowired
	GlogService glogService;
	@Autowired
	WHService whService;

	@RequestMapping("/detail")
	public String detail(
			Model model,
			GlogDTO glogDTO,
			@RequestParam(value="glogId") String glogId
		) {
		System.out.println("/warehouse/glog/detail controller.detail");
		
		glogDTO.setGlogId(glogId);
		
		// glogDTO 가져오기
		glogDTO = glogService.selectGlog(glogDTO);
		
		model.addAttribute("glog", glogDTO);
		
		return "P14_warehouse/glogDetail.tiles";
	}
	
	@RequestMapping("/delete")
	public String delete(
			@RequestParam(value="glogId") String glogId,
			@RequestParam(value="whId") String whId,
			GlogDTO glogDTO
			) {
		System.out.println("/warehouse/glog/detail controller.delete");
		
		glogDTO.setGlogId(glogId);
		
		glogService.deleteGlog(glogDTO);
		
		return "redirect:/warehouse/detail?whId=" + whId;
	}
	
	
	
	// ================================== //
	
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add (
			Model model,
			WHDTO whDTO,
			@RequestParam String whId
			) {
		System.out.println("/warehouse/glog/add controller.add");
		
		whDTO.setWhId(whId);
		whDTO = whService.selectWhDTO(whDTO);
		List<GhpDTO> ghpDTOList = new ArrayList();
		ghpDTOList = glogService.selectAllGhpWh(whDTO);
		
		model.addAttribute("whDTO", whDTO);
		model.addAttribute("ghpList", ghpDTOList);
		
		return "P14_warehouse/glogAdd.tiles";
	}
	
	@RequestMapping(value="/selectGhp", method = RequestMethod.GET)
	@ResponseBody
	public GhpDTO selectGhp(
			@RequestParam("ghpId") String ghpId,
			GhpDTO ghpDTO
			) {
		System.out.println("/warehouse/glog/add controller.selectGhp");
		ghpDTO.setGhpId(ghpId);
		
		ghpDTO = glogService.selectGhp(ghpDTO);
		
		return ghpDTO;
	} 
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertGlog(
			GlogDTO glogDTO,
			@RequestParam(value = "ghpImgFile", required = false) MultipartFile ghpImgFile,
			HttpServletRequest request
			) throws IllegalStateException, IOException {
		System.out.println("/warehouse/glog/add controller.insertGlog");
		
		// 점검 일시
		glogDTO.setGlogDate(
		    toTimestamp(glogDTO.getGlogDay(), glogDTO.getGlogTime())
		);

		// 조치 일시
		glogDTO.setGlogAdate(
		    toTimestamp(glogDTO.getGlogAday(), glogDTO.getGlogAtime())
		);
		
		String uploadPath = "D:/chop_upload/P14_warehouse/glog";
		String uploadUrl = "/upload/P14_warehouse/glog";
		
		glogService.insertGlog(glogDTO, ghpImgFile, uploadPath, uploadUrl);
		
		return "redirect:/warehouse/detail?whId=" + glogDTO.getGlogWhId();
	}

	
	
	// ================================== //
	
	
	
	@RequestMapping("/edit")
	public String edit(
			Model model,
			GlogDTO glogDTO,
			@RequestParam(value="glogId") String glogId
		) {
		System.out.println("/workplace/glog/edit controller.edit");
		
		// glogDTO 가져오기
		glogDTO = glogService.selectGlog(glogDTO);
		
		String dateStr = String.valueOf(glogDTO.getGlogDate());
		String day = dateStr.split(" ")[0];
		String time = dateStr.split(" ")[1];
		
		glogDTO.setGlogDay(day);
		glogDTO.setGlogTime(time);
		
		if(!( glogDTO.getGlogAdate() == null || "".equals( glogDTO.getGlogAdate() ) )) {
			String aStr = String.valueOf(glogDTO.getGlogAdate());
			String aDay = aStr.split(" ")[0];
			String aTime = aStr.split(" ")[1];
			
			glogDTO.setGlogAday(aDay);
			glogDTO.setGlogAtime(aTime);
		}
		
		model.addAttribute("glog", glogDTO);
		
		System.out.println(glogDTO);
		
		return "P14_warehouse/glogEdit.tiles";
	}

	@PostMapping("/update")
	public String update (
			GlogDTO glogDTO,
			@RequestParam(value = "ghpImgFile", required = false) MultipartFile ghpImgFile,
	        HttpServletRequest request
			) throws Exception {
		
		System.out.println("/warehouse/glog/edit controller.update");
		
		// 점검 일시
		glogDTO.setGlogDate(
		    toTimestamp(glogDTO.getGlogDay(), glogDTO.getGlogTime())
		);

		// 조치 일시
		glogDTO.setGlogAdate(
		    toTimestamp(glogDTO.getGlogAday(), glogDTO.getGlogAtime())
		);
		
	    String uploadPath = "D:/chop_upload/P14_warehouse/glog";
		String uploadUrl = "/upload/P14_warehouse/glog";
	    
	    glogService.updateGlog(glogDTO, ghpImgFile, uploadPath, uploadUrl);
		
		return "redirect:/warehouse/glog/detail?glogId=" + glogDTO.getGlogId();
	}
	
	
	
	// ================================== //
	

	
	private Timestamp toTimestamp(String day, String time) {
	    if (day == null || day.isEmpty() || time == null || time.isEmpty()) {
	        return null;
	    }

	    // 0:00 -> 00:00
	    if (time.length() == 4) {
	        time = "0" + time;
	    }

	    // 00:00:00 -> 00:00
	    if (time.length() >= 5) {
	        time = time.substring(0, 5);
	    }

	    return Timestamp.valueOf(day + " " + time + ":00");
	}

}