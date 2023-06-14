package dao;

import model.Share;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class ShareDao extends AbstractEntityDao<Share> {

	public ShareDao() {
		super(Share.class);
	}

}
