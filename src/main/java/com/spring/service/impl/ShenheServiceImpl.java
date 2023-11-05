package com.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.*;
import com.spring.entity.*;
import com.spring.service.*;
import com.spring.util.*;
import java.util.*;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

@Service("ShenheService")
public class ShenheServiceImpl implements ShenheService {

    @Resource
    private ShenheMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Shenhe> select() {
        return dao.select(null);
    }

    /**
     * 根据Shenhe类搜索数据
     * @param y
     * @return
     */
    public List<Shenhe> select(Shenhe y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取审核一行数据
     * @param id
     * @return
     */
    public Shenhe find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据审核获取审核类条件查询一行数据
     * @param id
     * @return
     */
    public Shenhe findEntity(Shenhe id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Shenhe> selectPage(Shenhe obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Shenhe> list = select(obj);
        PageInfo<Shenhe> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Shenhe> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Shenhe> list = dao.selectByExample(obj);
        PageInfo<Shenhe> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id) {
        return dao.deleteByPrimaryKey(id);
    }

    /**
     * 插入审核     * @param y
     * @return
     */
    public int insert(Shenhe y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新审核     * @param y
     * @return
     */
    public int update(Shenhe y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
