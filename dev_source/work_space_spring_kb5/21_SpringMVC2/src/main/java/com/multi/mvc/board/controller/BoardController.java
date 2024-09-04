package com.multi.mvc.board.controller;

import com.multi.mvc.board.service.BoardService;
import com.multi.mvc.board.vo.Board;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {

    @Setter(onMethod_ = @Autowired)
    private BoardService service;

    // /board/list
    @GetMapping("/list")
    public String list(Model model) {
        List<Board> list = service.getAllList();
        model.addAttribute("list", list);
        return "board/boardList";
    }

    @GetMapping("/view")
    public String view(Model model, long bno) {
        Board board = service.getBoard(bno);
        model.addAttribute("board", board);
        return "board/boardView";
    }

    // /board/write
    @GetMapping("/write")
    public String writePage(){
        return "board/boardWrite";
    }

    @PostMapping("/write")
    public String write(Model model, Board board) {
        Board result = service.write(board);
        if(result == null){
            return "redirect:/board/list";
        }
        return "redirect:/board/view?bno=" + result.getBno();
    }

    @GetMapping("/update")
    public String update(@RequestParam("bno") long bno, Model model) {
        Board board = service.getBoard(bno);
        model.addAttribute("board", board);
        return "board/boardUpdate";
    }

    @PostMapping("/update")
    public String update(Board board) {
        Board result = service.update(board);
        if(result == null){
            return "redirect:/board/list";
        }
        return "redirect:/board/view?bno=" + result.getBno();
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("bno") long bno) {
        service.delete(bno);
        return "redirect:/board/list";
    }
}
