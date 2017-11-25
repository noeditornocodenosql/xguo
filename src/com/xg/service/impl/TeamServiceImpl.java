package com.xg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xg.mapper.TeamMapper;
import com.xg.model.Page;
import com.xg.model.Team;
import com.xg.service.TeamService;

@Transactional
@Service
public class TeamServiceImpl implements TeamService {

    @Resource
    private TeamMapper teamMapper;
	@Override
	public List<Team> findAllTeam(Page page) {
		return teamMapper.findAllTeam(page);
	}

	@Override
	public Team findTeamByTid(Integer tId) {
		return teamMapper.findTeamByTid(tId);
	}

	@Override
	public void updateTeamByTid(Team team) {
		teamMapper.updateTeamByTid(team);

	}

	@Override
	public void deleteTeamByTid(Integer tId) {
		teamMapper.deleteTeamByTid(tId);
	}

	@Override
	public long getAllTeamCount() {
		return teamMapper.getAllTeamCount();
	}

	@Override
	public void saveTeam(Team team) {
		teamMapper.saveTeam(team);
		
	}

	@Override
	public List<Team> findAllTeamWithNoPage() {
		return teamMapper.findAllTeamWithNoPage();
	}

}
