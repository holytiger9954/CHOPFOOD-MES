package kr.or.chop.P04_sugg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P04_sugg.dto.CommentDTO;
import kr.or.chop.P04_sugg.service.CommentService;

@Controller
@RequestMapping("/sugg/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @PostMapping("/add")
    public String add(CommentDTO dto) {
        System.out.println("/sugg/comment/add 실행");
        System.out.println("dto : " + dto);

        commentService.insertComment(dto);

        return "redirect:/sugg/detail?sugg_no=" + dto.getComm_sugg_no();
    }

    @PostMapping("/edit")
    public String edit(CommentDTO dto) {
        System.out.println("/sugg/comment/edit 실행");
        System.out.println("dto : " + dto);

        commentService.updateComment(dto);

        return "redirect:/sugg/detail?sugg_no=" + dto.getComm_sugg_no();
    }

    @PostMapping("/delete")
    public String delete(int comm_no, int comm_sugg_no) {
        System.out.println("/sugg/comment/delete 실행");
        System.out.println("comm_no : " + comm_no);
        System.out.println("comm_sugg_no : " + comm_sugg_no);

        commentService.deleteComment(comm_no);

        return "redirect:/sugg/detail?sugg_no=" + comm_sugg_no;
    }
}