package kr.or.chop.P21_manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P21_manage.dto.AdminDTO;
import kr.or.chop.P21_manage.service.AdminService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/admin")
public class AdminListController {

    @Autowired
    AdminService adminService;

    @RequestMapping("/list")
    public String adminList(
            AdminDTO adminDTO,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            Model model) {

        int listCount = adminService.selectAdminCount(adminDTO);

        int totalAdminCount = adminService.selectAdminCount(new AdminDTO());

        PageInfo page = Pagination.getPageInfo(
                listCount,
                currentPage,
                5,
                10
        );

        List<AdminDTO> adminList =
                adminService.selectAdminList(adminDTO, page);
        
        List<AdminDTO> deptSummary =
                adminService.selectDeptSummary();

        model.addAttribute("adminList", adminList);
        model.addAttribute("deptSummary", deptSummary);
        model.addAttribute("totalAdminCount", totalAdminCount);

        model.addAttribute("page", page);
        model.addAttribute("search", adminDTO);

        return "P21_manage/adminList.tiles";
    }
}