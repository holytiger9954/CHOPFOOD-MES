package kr.or.chop.P21_manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P21_manage.dto.AdminDTO;
import kr.or.chop.P21_manage.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminAddController {

    @Autowired
    AdminService adminService;

    @RequestMapping("/add")
    public String adminAdd() {
        return "P21_manage/adminAdd.tiles";
    }

    @RequestMapping("/insert")
    public String adminInsert(AdminDTO adminDTO) {

        adminService.insertAdmin(adminDTO);

        return "redirect:/admin/list";
    }
}