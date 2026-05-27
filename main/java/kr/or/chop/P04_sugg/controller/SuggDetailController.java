package kr.or.chop.P04_sugg.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P04_sugg.dto.CommentDTO;
import kr.or.chop.P04_sugg.dto.SuggDTO;
import kr.or.chop.P04_sugg.service.CommentService;
import kr.or.chop.P04_sugg.service.SuggService;
import kr.or.chop.P01_login.dto.EmpDTO;

@Controller
@RequestMapping("/sugg/detail")
public class SuggDetailController {

    @Autowired
    SuggService suggService;

    @Autowired
    CommentService commentService;

    // 상세 페이지 진입
    @GetMapping
    public String detail(Integer sugg_no,
                         HttpSession session,
                         Model model) {

        System.out.println("/sugg/detail 실행");

        EmpDTO loginUser =
                (EmpDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        SuggDTO dto =
                suggService.selectSuggDetail(sugg_no);

        System.out.println("sugg_no : " + sugg_no);
        System.out.println("dto : " + dto);

        if (dto == null) {
            return "redirect:/sugg/list";
        }

        boolean isAdmin = false;

        if (loginUser.getEmpAuth() >= 20) {
            isAdmin = true;
        }

        boolean isWriter = false;

        if (loginUser.getEmpId().equals(dto.getSugg_writer())) {
            isWriter = true;
        }

        Boolean auth =
                (Boolean) session.getAttribute(
                        "suggAuth_" + sugg_no
                );

        // 관리자 아니면 작성자여도 비밀번호 인증 필요
        if (!isAdmin && (auth == null || !auth)) {
            return "redirect:/sugg/list";
        }

        List<CommentDTO> commList =
                commentService.selectCommentList(sugg_no);

        model.addAttribute("dto", dto);
        model.addAttribute("commList", commList);

        // 상세페이지에서 수정 버튼 제어용
        model.addAttribute("isWriter", isWriter);
        model.addAttribute("isAdmin", isAdmin);

        return "P04_sugg/suggDetail.tiles";
    }

    // 비밀번호 확인
    @PostMapping
    public String detailCheck(SuggDTO checkDTO,
                              HttpSession session) {

        System.out.println("/sugg/detail 비밀번호 확인 실행");

        SuggDTO dto =
                suggService.selectSuggDetail(
                        checkDTO.getSugg_no()
                );

        if (dto == null) {
            return "redirect:/sugg/list";
        }

        // 비밀번호 비교
        if (checkDTO.getSugg_pw() == null
                || !checkDTO.getSugg_pw()
                .equals(dto.getSugg_pw())) {

            System.out.println("비밀번호 불일치");
            
            session.setAttribute(
                    "pwdError",
                    "비밀번호가 일치하지 않습니다."
            );

            return "redirect:/sugg/list";
        }

        // 이전 에러 메시지 제거
        session.removeAttribute("pwdError");
        
        // 인증 성공 시 session 저장
        session.setAttribute(
                "suggAuth_" + checkDTO.getSugg_no(),
                true
        );

        System.out.println("비밀번호 일치");

        return "redirect:/sugg/detail?sugg_no="
                + checkDTO.getSugg_no();
    }
}