package com.team.cf.dao;

import com.team.cf.entity.ProjectReturn;

import java.sql.SQLException;

public interface ProjectReturnDao {
    //插入一条回报信息
    public int insertReturn(ProjectReturn projectReturn) throws SQLException;
}
