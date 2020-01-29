package com.eis.wap.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eis.wap.dao.CommentMasterId;
import com.eis.wap.dao.DivisionDAO;
import com.eis.wap.dao.PsrCommentDao;
import com.eis.wap.domain.CommentMaster;
 
import com.eis.wap.model.PsrComments;
import com.eis.wap.service.PsrCommentService;
@Component
public class PsrCommentsServiceImpl implements PsrCommentService {
	
	@Autowired
   PsrCommentDao psrCommentsDAO;

	@Override
	public void add(PsrComments c) {
	
		CommentMaster comMaster=new CommentMaster();
		CommentMasterId idObj=new CommentMasterId();
		comMaster.setComment(c.getComments());
		idObj.setEcode(c.getEcode());
		idObj.setMth(c.getMth());
		idObj.setNetid(c.getNetId());
		idObj.setYr(c.getYr());
		comMaster.setIdObj(idObj);
		psrCommentsDAO.save(comMaster);
	
		}
		
	}


