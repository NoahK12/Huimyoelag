package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CatUserDTO;

public class MailSendDaoImp implements MailSendDAO{
	
	private SqlSessionTemplate mailSqlsession;
	
	public void setMailSqlsession(SqlSessionTemplate mailSqlsession) {
		this.mailSqlsession = mailSqlsession;
	}
	
	public MailSendDaoImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void keyDataMethod(CatUserDTO dto) {
		mailSqlsession.insert("mail.insertKey",dto);
		
	}

	@Override
	public String keyDataGetMethod(CatUserDTO dto) {
		
		return mailSqlsession.selectOne("mail.keyGet",dto);
	}

	@Override
	public void emailDeleteMethod(CatUserDTO dto) {
		mailSqlsession.delete("mail.deleteMail",dto);
	}

	@Override
	public int emailCheckMethod(CatUserDTO dto) {
		return mailSqlsession.selectOne("mail.email_check_regist",dto);
	}

	@Override
	public void updateKeyMethod(CatUserDTO dto) {
		mailSqlsession.update("mail.updateKey",dto);
	}
	
	
	
	
}
