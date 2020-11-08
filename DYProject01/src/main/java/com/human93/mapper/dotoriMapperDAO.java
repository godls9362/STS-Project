package com.human93.mapper;

import java.util.ArrayList;

import com.human93.VO.MemberVO;

public interface dotoriMapperDAO {
	public void insertOne(MemberVO vo);
	public MemberVO check_id(String id);
	public MemberVO selectOne(String id);

}
