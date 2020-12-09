package show.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.face.AdminDao;
import show.dto.Admin;
import show.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDao adminDao;
	
	@Override
	public boolean adminLogin(Admin admin) {
		
		logger.info("adminLogin시작");
		
		if( adminDao.selectAdminCnt(admin) >= 1 ) {
			return true;
		}
		
		logger.info("adminLogin끝");
		
		return false;
	}

	@Override
	public Admin admininfo(String adminid) {
		logger.info("admininfo시작");
		return adminDao.selectAdminById(adminid);
	}

}
