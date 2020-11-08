package com.human93.service;

import java.util.ArrayList;

import com.human93.VO.BCommentVO;
import com.human93.VO.BoardVO;
import com.human93.VO.MemberVO;
import com.human93.VO.PageVO;

public interface dotoriService {
	//회원과 관련된 기능 <<<
	public void insertOne(MemberVO vo);
	public MemberVO check_id(String id);
	public MemberVO selectOne(String id);
	//회원 끝 >>>
	//게시판과 관련된 기능 <<<
	public ArrayList<BoardVO> bselectAll();
	public void binsert(BoardVO vo);
	public String bgetSeq();
	public BoardVO bselectOne(String no);
	public void bdeleteOne(BoardVO vo);
	public void bupdateOne(BoardVO vo);
	public int countBno();
	//댓글과 관련되 기능 <<<<<
	public int CommentIn(BCommentVO bvo);
	public ArrayList<BCommentVO> selectBC(String Bno);
	public int deleteONEBC(String Cno);
	/////////답글<<<<<<<<<<<<
	public BoardVO getgroupOrd(String no);
	public int saveRly(BoardVO vo);
	public void sameRlyUp(String originNo);
	public void anotherRlyUp(int groupOrd);
}
