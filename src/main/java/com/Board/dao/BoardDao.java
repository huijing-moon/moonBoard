package com.Board.dao;

import com.Board.vo.BoardVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class BoardDao {

    private static final String namespace="com.Board.dao.BoardDao";

    private final SqlSession sql;

    @Inject
    public BoardDao(SqlSession sql){
        this.sql = sql;
    }

    public void create(BoardVo vo)throws Exception{
        sql.insert(namespace+".create", vo);
    }

    public BoardVo read(String id) throws Exception{
        return sql.selectOne(namespace+".selectOne", id);
    }

    public void update(BoardVo vo)throws Exception{
        sql.update(namespace+".update", vo);
    }

    public void delete(BoardVo vo) throws Exception{
        sql.delete(namespace+".delete", vo);
    }

    public List<BoardVo> selectList( ) throws Exception{
        return sql.selectList(namespace+".selectList");
    }

    public Integer count(String searchType, String keyword) throws Exception{
        HashMap data = new HashMap();

        data.put("searchType", searchType);
        data.put("keyword", keyword);

        return sql.selectOne(namespace+".count", data);
    }

    public List<BoardVo> listPage(int displayPost, int postNum, String searchType, String keyword) throws Exception{
        HashMap data = new HashMap();

        data.put("displayPost", displayPost);
        data.put("postNum", postNum);
        data.put("searchType", searchType);
        data.put("keyword", keyword);

        return sql.selectList(namespace+".listPage", data);
    }

}
