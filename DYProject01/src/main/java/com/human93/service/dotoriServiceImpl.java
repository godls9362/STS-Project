package com.human93.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human93.VO.BCommentVO;
import com.human93.VO.BoardVO;
import com.human93.VO.MemberVO;
import com.human93.VO.PageVO;
import com.human93.mapper.BcommentMapperDAO;
import com.human93.mapper.boardMapperDAO;
import com.human93.mapper.dotoriMapperDAO;

@Service
public class dotoriServiceImpl implements dotoriService {
	private dotoriMapperDAO mapper;
	private boardMapperDAO mapper2nd;
	private BcommentMapperDAO mapper3rd;
	@Autowired
	private SqlSession sqlSession;

	// 회원과 관련된 기능 >>>>>>>>>>>>>>>>>>>>>
	@Override
	public void insertOne(MemberVO vo) {
		mapper = sqlSession.getMapper(dotoriMapperDAO.class);
		mapper.insertOne(vo);
	}

	@Override
	public MemberVO check_id(String id) {
		mapper = sqlSession.getMapper(dotoriMapperDAO.class);
		MemberVO vo = mapper.check_id(id);
		return vo;
	}

	@Override
	public MemberVO selectOne(String id) {
		mapper = sqlSession.getMapper(dotoriMapperDAO.class);
		MemberVO vo = mapper.selectOne(id);
		vo.getPwd();
		return vo;
	}

	// --------------------------회원 끝
	// 게시판과 관련된 기능>>>>>>>>>>>>>>>>>>>>>
	@Override
	public ArrayList<BoardVO> bselectAll() {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		ArrayList<BoardVO> list = mapper2nd.bselectAll();
		String cutter = null;
		for (int i = 0; i < list.size(); i++) {
			cutter = list.get(i).getRegtime().substring(0, 4) + "년";
			cutter += list.get(i).getRegtime().substring(5, 7) + "월";
			cutter += list.get(i).getRegtime().substring(8, 10) + "일";
			cutter += list.get(i).getRegtime().substring(11, 13) + "시";
			cutter += list.get(i).getRegtime().substring(14, 16) + "분";
			cutter += list.get(i).getRegtime().substring(17, 19) + "초";
			list.get(i).setRegtime(cutter);
		}
		return list;
	}

	@Override
	public void binsert(BoardVO vo) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		mapper2nd.binsert(vo);
	}

	@Override
	public String bgetSeq() {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		return mapper2nd.bgetSeq();
	}

	@Override
	public BoardVO bselectOne(String no) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		return mapper2nd.bselectOne(no);
	}

	@Override
	public void bdeleteOne(BoardVO vo) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);

		mapper2nd.bdeleteOne(vo);
	}

	@Override
	public void bupdateOne(BoardVO vo) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		mapper2nd.bupdateOne(vo);
	}

	@Override
	public int countBno() {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);

		return mapper2nd.countBno();
	}

	/////////////////// 댓글

	@Override
	public int CommentIn(BCommentVO bvo) {
		mapper3rd = sqlSession.getMapper(BcommentMapperDAO.class);
		return mapper3rd.CommentIn(bvo);
	}

	@Override
	public ArrayList<BCommentVO> selectBC(String Bno) {
		mapper3rd = sqlSession.getMapper(BcommentMapperDAO.class);
		return mapper3rd.selectBC(Bno);
	}

	@Override
	public int deleteONEBC(String Cno) {
		mapper3rd = sqlSession.getMapper(BcommentMapperDAO.class);

		return mapper3rd.deleteONEBC(Cno);
	}

	//////////////////// 답글
	@Override
	public BoardVO getgroupOrd(String no) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		return mapper2nd.getgroupOrd(no);
	}

	@Override
	public int saveRly(BoardVO vo) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		return mapper2nd.saveRly(vo);
	}

	@Override
	public void sameRlyUp(String originNo) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		mapper2nd.sameRlyUp(originNo);
	}

	@Override
	public void anotherRlyUp(int groupOrd) {
		mapper2nd = sqlSession.getMapper(boardMapperDAO.class);
		mapper2nd.anotherRlyUp(groupOrd);
	}

}
