package com.project1.service;

import com.project1.domain.Board;
import com.project1.domain.CustomUser;
import com.project1.domain.Member;
import com.project1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            board.setMemberId(member.getId());
            mapper.insert(board);
        }
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }

    public List<Board> list() {
        return mapper.selectAll();
    }

    public void remove(Integer id) {
        mapper.deleteById(id);
    }

    public void modify(Board board) {
        mapper.update(board);
    }

    public Map<String, Object> list(Integer page) {
        int offset = (page - 1) * 10;

        int numberOfBoard = mapper.countAll();

        int lastPageNumber = (numberOfBoard - 1) / 10 + 1;
        int endPageNumber = ((page - 1) / 10 + 1) * 10;
        int beginPageNumber = endPageNumber - 9;
        endPageNumber = Math.min(endPageNumber, lastPageNumber);

        int prevPageNumber = beginPageNumber - 10;
        int nextPageNumber = beginPageNumber + 10;


        return Map.of("boardList", mapper.selectAllByPage(offset),
                "pageInfo", Map.of("lastPageNumber", lastPageNumber,
                        "endPageNumber", endPageNumber,
                        "beginPageNumber", beginPageNumber,
                        "prevPageNumber", prevPageNumber,
                        "nextPageNumber", nextPageNumber,
                        "currentPageNumber", page)
        );
    }

    public boolean hasAccess(Integer id, Authentication authentication) {
        //로그인 안한거
        if (authentication == null) {
            return false;
        }
        //로그인 한거
        Board board = mapper.selectById(id);

        //게시글에 있는 member id랑 로그인 id랑 같으면 true
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            //principal은 객체를 꺼내기 위해 사용
            return board.getMemberId().equals(member.getId());
        }
        return false;
    }
}
