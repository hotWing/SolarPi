package com.solarpi.model;

import java.util.List;

public class StatsJSON {
	private String label;
	private List stats;
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public List getStats() {
		return stats;
	}
	public void setStats(List stats) {
		this.stats = stats;
	}
}
