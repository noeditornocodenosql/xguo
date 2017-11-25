package com.xg.service;

import java.util.List;

import com.xg.model.Page;
import com.xg.model.Team;

public interface TeamService {
	public long getAllTeamCount();
	public List<Team>findAllTeam(Page page);
	public Team findTeamByTid(Integer tId);
	public void updateTeamByTid(Team team);
	public void deleteTeamByTid(Integer tId);
	public void saveTeam(Team team);
	public List<Team>findAllTeamWithNoPage();
}
