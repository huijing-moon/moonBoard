package com.Board.service.Impl;

import com.Board.dao.BoardDao;
import com.Board.service.BoardService;
import com.Board.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    public BoardDao boardDao;



    @Override
    public void create(BoardVo boardVo) throws Exception{
        boardDao.create(boardVo);
    }

    @Override
    public BoardVo read(String id) throws Exception{
        return boardDao.read(id);
    }

    @Override
    public void update(BoardVo boardVo) throws Exception{
        boardDao.update(boardVo);
    }

    @Override
    public void delete(BoardVo boardVo) throws Exception{
        boardDao.delete(boardVo);
    }

    @Override
    public List<BoardVo> listAll( ) throws Exception {
        return boardDao.selectList();
    }

    @Override
    public int count(String searchType, String keyword) throws Exception {
        return boardDao.count(searchType, keyword);
    }



    @Override
    public List<BoardVo> listPage(int displayPost, int postNum, String searchType, String keyword) throws Exception {
        return boardDao.listPage(displayPost, postNum, searchType, keyword);
    }

}
