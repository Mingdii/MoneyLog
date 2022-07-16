/*
package com.test.mvc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxDAO
{
	@Autowired
    private SqlSessionTemplate template;

    public List<UserDTO> getList(String inoutCd) 
    {
    	return template.selectList("ajax.getList");
    }
    
    public UserDTO getUser() 
    {
        return template.selectOne("ajax.getUser");
    }
}
*/