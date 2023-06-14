package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import model.Video;

public class VideoDao extends AbstractEntityDao<Video> {
	public VideoDao() {
		super(Video.class);
	}

	
}
