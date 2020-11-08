package com.human93.mapper;

import java.util.ArrayList;

import com.human93.VO.BoardVO;
import com.human93.VO.PageVO;

public interface boardMapperDAO {
	public ArrayList<BoardVO> bselectAll();
	public void binsert(BoardVO vo);
	public String bgetSeq();
	public BoardVO bselectOne(String no);
	public void bdeleteOne(BoardVO vo);
	public void bupdateOne(BoardVO vo);
	public int countBno();
	/////////////////////////´ä±Û 
	public BoardVO getgroupOrd(String no);
	public int saveRly(BoardVO vo);
	public void sameRlyUp(String originNo);
	public void anotherRlyUp(int groupOrd);
}

