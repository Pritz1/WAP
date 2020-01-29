package com.eis.wap.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.eis.wap.domain.CommentMaster;
 

public interface PsrCommentDao extends JpaRepository<CommentMaster, CommentMasterId>{
	
 	
	
}
