package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public int register(ReplyVO replyVO) {
		
		log.info("register................" + replyVO);
		return replyMapper.insert(replyVO);
	}

	@Override
	public ReplyVO get(Long rno) {
		
		log.info("get................" + rno);
		return replyMapper.read(rno);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		
		log.info("modify................" + replyVO);
		return replyMapper.update(replyVO);
	}

	@Override
	public int remove(Long rno) {
		
		log.info("remove................" + rno);
		return replyMapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		log.info("getList................" + bno);
		return replyMapper.getListWithPaging(cri, bno);
	}
	
	
	
	
	

}
