package com.project1.controller;

import com.project1.domain.Board;
import com.project1.service.BoardService;
import jakarta.servlet.ServletConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService service;
    private final ServletConfig servletConfig;

    @GetMapping("/add")
    public String add() {

        return "board/add";
    }

    @PostMapping("/add")
    public String addPost(Board board, RedirectAttributes redirectAttributes) {
        System.out.println("BoardController.addPost");
        System.out.println("board = " + board);
        service.add(board);
        redirectAttributes.addAttribute("id", board.getId());
        return "redirect:/";
    }

    // /board?id=3
    @GetMapping("/board")
    public String view(Integer id, Model model) {
        // 게시물 조회(select) 조회 결과 모델에 넣고 jsp로 포워딩
        Board board = service.get(id);
        model.addAttribute("board", board);
        return "board/view";
    }

    @GetMapping("/")
    public String home(Model model) {
        // 게시물 목록 조회(Select)
        // 모델에 넣고
        model.addAttribute("boardList", service.list());
        //jsp로 포워드
        return "board/home";
    }

    @PostMapping("/delete")
    public String delete(Integer id) {
        service.remove(id);
        return "redirect:/";
    }

    @GetMapping("/modify")
    public String modifyForm(Integer id, Model model) {
        //조회 해서
        // 모델에 넣고
        model.addAttribute("board", service.get(id));
        //view로 포워드
        return "board/modify";
    }

    @PostMapping("/modify")
    public String modifyPost(Board board, RedirectAttributes redirectAttributes) {
        System.out.println("board = " + board);
        service.modify(board);
        redirectAttributes.addAttribute("id", board.getId());
        return "redirect:/board"; // 글을 보는 화면으로 리다이렉트
    }

}
