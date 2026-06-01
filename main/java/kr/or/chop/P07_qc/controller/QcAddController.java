package kr.or.chop.P07_qc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.chop.P07_qc.dto.QcDTO;
import kr.or.chop.P07_qc.service.QcService;

@Controller
@RequestMapping("/quality")
public class QcAddController {

	@Autowired
	private QcService qcService;

	@RequestMapping("/add")
	public String qualityAdd(Model model, String qcId) {

		QcDTO qc = qcService.selectQcDetail(qcId);

		model.addAttribute("qc", qc);
		return "P07_qc/qcAdd.tiles";
	}

	@RequestMapping("/lotList")
	@ResponseBody
	public List<QcDTO> lotList() {
		return qcService.selectQcLotList();
	}

	@RequestMapping("/insertDo")
	public String insertDo(QcDTO qcDTO) {

		qcService.insertQc(qcDTO);

		return "redirect:/quality/list";
	}
	
	@RequestMapping("/workerList")
	@ResponseBody
	public List<QcDTO> workerList(String searchKeyword) {
		return qcService.selectQcWorkerList(searchKeyword);
	}

}
