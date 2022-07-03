package com.Board.service;

import com.Board.vo.BoardVo;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BoardService {

     void create(BoardVo boardVo) throws Exception;

     BoardVo read(String id) throws Exception;

     void update(BoardVo boardVo) throws Exception;

     void delete(BoardVo boardVo)throws Exception;

     List<BoardVo> listAll() throws Exception;

     int count(String searchType, String keyword) throws Exception;

      List<BoardVo> listPage(int displayPost, int postNum, String searchType, String keyword) throws Exception;
}
