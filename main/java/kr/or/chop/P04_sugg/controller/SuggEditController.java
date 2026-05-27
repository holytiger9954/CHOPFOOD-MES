package kr.or.chop.P04_sugg.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P01_login.dto.EmpDTO;
import kr.or.chop.P04_sugg.dto.SuggDTO;
import kr.or.chop.P04_sugg.service.SuggService;

@Controller
@RequestMapping("/sugg")
public class SuggEditController {

    @Autowired
    SuggService suggService;

    @GetMapping("/edit")
    public String editForm(Integer sugg_no,
                           Model model,
                           HttpSession session) {

        EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        SuggDTO dto = suggService.selectSuggDetail(sugg_no);

        if (dto == null) {
            return "redirect:/sugg/list";
        }

        // 작성자만 수정 페이지 접근 가능
        if (!loginUser.getEmpId().equals(dto.getSugg_writer())) {
            return "redirect:/sugg/detail?sugg_no=" + sugg_no;
        }

        model.addAttribute("dto", dto);

        return "P04_sugg/suggEdit.tiles";
    }

    @PostMapping("/edit")
    public String edit(SuggDTO dto,
                       MultipartFile uploadFile,
                       HttpSession session) throws Exception {

        EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        SuggDTO origin = suggService.selectSuggDetail(dto.getSugg_no());

        if (origin == null) {
            return "redirect:/sugg/list";
        }

        // 작성자만 수정 가능
        if (!loginUser.getEmpId().equals(origin.getSugg_writer())) {
            return "redirect:/sugg/detail?sugg_no=" + dto.getSugg_no();
        }

        // 비밀번호는 수정 못 하게 기존 비밀번호 유지
        dto.setSugg_pw(origin.getSugg_pw());

        if (uploadFile != null && !uploadFile.isEmpty()) {

            String originName = uploadFile.getOriginalFilename();

            String saveName =
                    System.currentTimeMillis() + "_" + originName;

            String uploadPath =
                    session.getServletContext()
                           .getRealPath("/resources/upload/sugg");

            File folder = new File(uploadPath);

            if (!folder.exists()) {
                folder.mkdirs();
            }

            File saveFile = new File(uploadPath, saveName);

            uploadFile.transferTo(saveFile);

            dto.setSugg_file_origin_name(originName);
            dto.setSugg_file_save_name(saveName);
        }

        suggService.updateSugg(dto);

        return "redirect:/sugg/detail?sugg_no="
                + dto.getSugg_no();
    }

    @PostMapping("/delete")
    public String delete(int sugg_no,
                         HttpSession session) {

        EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        SuggDTO dto = suggService.selectSuggDetail(sugg_no);

        if (dto == null) {
            return "redirect:/sugg/list";
        }

        // 작성자 또는 관리자만 삭제 가능
        if (!loginUser.getEmpId().equals(dto.getSugg_writer())
                && loginUser.getEmpAuth() < 20) {

            return "redirect:/sugg/detail?sugg_no=" + sugg_no;
        }

        suggService.deleteSugg(sugg_no);

        return "redirect:/sugg/list";
    }

    @PostMapping("/answer")
    public String updateAnswer(SuggDTO dto,
                               HttpSession session) {

        EmpDTO loginUser =
                (EmpDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        if (loginUser.getEmpAuth() < 20) {
            return "redirect:/sugg/detail?sugg_no="
                    + dto.getSugg_no();
        }

        suggService.updateSuggAnswer(dto);

        return "redirect:/sugg/list";
    }
}