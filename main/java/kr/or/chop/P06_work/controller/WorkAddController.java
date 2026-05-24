package kr.or.chop.P06_work.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.chop.P05_plan.dto.PlanDTO;
import kr.or.chop.P06_work.dto.WorkDTO;
import kr.or.chop.P06_work.service.WorkService;

@Controller
@RequestMapping("/work")
public class WorkAddController {

	@Autowired
	WorkService workService;

	@RequestMapping("/add")
	public String add() {
		return "P06_work/workAdd.tiles";
	}

	@GetMapping("/planList")
	@ResponseBody
	public List<PlanDTO> planList() {
		return workService.selectWorkPlanList();
	}

	@GetMapping("/workerList")
	@ResponseBody
	public List<WorkDTO> workerList(WorkDTO workDTO) {
		return workService.selectWorkerList(workDTO);
	}

	@RequestMapping("/insert")
	public String insert(
			WorkDTO workDTO,
			RedirectAttributes rttr
		) {
		
		int result = workService.insertWork(workDTO);

		if (result > 0) {
			rttr.addFlashAttribute("msg", "작업 지시가 등록되었습니다.");
			return "redirect:/work/list";
		}

		rttr.addFlashAttribute("msg", "작업 지시 등록에 실패했습니다.");
		return "redirect:/work/add";
	}
}