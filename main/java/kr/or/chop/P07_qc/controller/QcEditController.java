package kr.or.chop.P07_qc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P07_qc.dto.QcDTO;
import kr.or.chop.P07_qc.service.QcService;

@Controller
@RequestMapping("/quality")
public class QcEditController {

	@Autowired
    private QcService qcService;

    @RequestMapping("/edit")
    public String edit(String qcId, Model model) {

        QcDTO qc = qcService.selectQcDetail(qcId);

        model.addAttribute("qc", qc);

        return "P07_qc/qcEdit.tiles";
    }

    @RequestMapping("/updateDo")
    public String updateDo(QcDTO qcDTO) {

        qcService.updateQc(qcDTO);

        return "redirect:/quality/detail?qcId=" + qcDTO.getQcId();
    }

    @RequestMapping("/delete")
    public String delete(String qcId) {

        qcService.deleteQc(qcId);

        return "redirect:/quality/list";
    }
	
}
