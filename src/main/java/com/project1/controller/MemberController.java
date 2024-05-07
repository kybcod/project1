package com.project1.controller;

import com.project1.domain.Member;
import com.project1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
        return "redirect:/member/list";
    }

    @GetMapping("list")
    @PreAuthorize("hasAnyAuthority('admin')")
    public String list(Member member, Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("")
    public String view(Integer id, Authentication authentication, Model model) {
        if (service.hasAccess(id, authentication)) {
            model.addAttribute("member", service.get(id));
            return "member/info";
        }
        return "redirect:/";
    }

    @PostMapping("remove")
    public String remove(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication)) {
            service.remove(id);
        }
//        return "redirect:/member/signup";
        return "redirect:/logout";
    }

    // 처음에 수정 클릭 시 member/modify?id=?로
    @GetMapping("modify")
    public String modify(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        return "member/modify";
    }

    // member/modify?id=?에서 수정 클릭 시 member/list로 리다이렉트
    @PostMapping("modify")
    public String modifyPost(Member member, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(member.getId(), authentication)) {
            service.modify(member);
        }
        rttr.addAttribute("id", member.getId());
        return "redirect:/member";
    }

    //이메일 check
    @GetMapping("email")
    @ResponseBody
    public String emailCheck(String email) {
        String message = service.emailCheck(email);
        return message;
    }

    @GetMapping("login")
    public String loginForm() {

        return "member/login";
    }
}
