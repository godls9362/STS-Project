package com.human93.mapper;

import java.util.ArrayList;

import com.human93.VO.BCommentVO;

public interface BcommentMapperDAO {
	public int CommentIn(BCommentVO bvo);
	public ArrayList<BCommentVO> selectBC(String Bno);
	public int deleteONEBC(String Cno);
}
