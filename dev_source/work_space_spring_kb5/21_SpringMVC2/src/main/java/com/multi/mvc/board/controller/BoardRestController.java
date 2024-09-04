package com.multi.mvc.board.controller;

import com.multi.mvc.board.service.BoardService;
import com.multi.mvc.board.vo.Board;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest")
@Slf4j
@RequiredArgsConstructor
public class BoardRestController {

    private final BoardService service;

    // /rest/board
    @GetMapping("/board")
    public ResponseEntity<List<Board>> getBoards() {
        List<Board> list = service.getAllList();
        if(list == null || list.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(list);
//        return ResponseEntity.status(200).body(list);
    }

    // /rest/board/3
    @GetMapping("/board/{bno}")
    public ResponseEntity<Board> getBoard(@PathVariable long bno) {
        Board board = service.getBoard(bno);
        if(board == null) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(board);
//        return ResponseEntity.status(200).body(list);
    }
    
    @PostMapping("/board")
    public ResponseEntity<Board> create(@RequestBody Board board) {
        Board result = service.write(board);
        if(result == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(result);
    }

    @PutMapping("/board/{bno}")
    public ResponseEntity<Board> update(@PathVariable Long bno, @RequestBody Board board) {
        board.setBno(bno);
        Board result = service.update(board);
        if(result == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/board/{bno}")
    public ResponseEntity<Board> delete(@PathVariable Long bno) {
        Board result = service.delete(bno);
        if(result == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(result);
    }
}
