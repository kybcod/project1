package com.project1.controller;

import com.project1.domain.Member;
import com.project1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("member") // /member + (/view or /signup/delete)
public class MemberController {

    private final MemberService service;

    @GetMapping("signup")
    public void signup() {
    }

    @PostMapping("signup")
    public String signup(Member member) {
        service.signup(member);
        return "redirect:/";
    }

    @GetMapping("list")
    public String list(Member member, Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("view")
    public String view(Integer id, Model model, RedirectAttributes rttr) {
        model.addAttribute("member", service.selectAll(id));
        return "member/view";
    }
}
