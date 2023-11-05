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

@Service("ToupiaoxinxiService")
public class ToupiaoxinxiServiceImpl implements ToupiaoxinxiService {

    @Resource
    private ToupiaoxinxiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Toupiaoxinxi> select() {
        return dao.select(null);
    }

    /**
     * 根据Toupiaoxinxi类搜索数据
     * @param y
     * @return
     */
    public List<Toupiaoxinxi> select(Toupiaoxinxi y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取投票信息一行数据
     * @param id
     * @return
     */
    public Toupiaoxinxi find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据投票信息获取投票信息类条件查询一行数据
     * @param id
     * @return
     */
    public Toupiaoxinxi findEntity(Toupiaoxinxi id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Toupiaoxinxi> selectPage(Toupiaoxinxi obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Toupiaoxinxi> list = select(obj);
        PageInfo<Toupiaoxinxi> pageInfo = new PageInfo(list);
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
    public List<Toupiaoxinxi> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Toupiaoxinxi> list = dao.selectByExample(obj);
        PageInfo<Toupiaoxinxi> pageInfo = new PageInfo(list);
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
     * 插入投票信息     * @param y
     * @return
     */
    public int insert(Toupiaoxinxi y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新投票信息     * @param y
     * @return
     */
    public int update(Toupiaoxinxi y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
