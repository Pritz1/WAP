package com.eis.wap.domain;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.eis.wap.dao.CommentMasterId;

@Entity
@Table(name = "PsrComments")
public class CommentMaster implements Serializable{

	 
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private CommentMasterId idObj;
	
	private String comments;
	

	public String getComment() {
		return comments;
	}
	public void setComment(String comment) {
		this.comments = comment;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public CommentMasterId getIdObj() {
		return idObj;
	}
	public void setIdObj(CommentMasterId idObj) {
		this.idObj = idObj;
	}
	
	
	

}
