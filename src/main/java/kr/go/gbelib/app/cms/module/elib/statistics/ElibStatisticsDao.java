package kr.go.gbelib.app.cms.module.elib.statistics;

import java.util.List;
import java.util.Map;

public interface ElibStatisticsDao {
	
	public List<ElibStatistics> getStatisticsByTime(ElibStatistics elibStatistics);
	
	public List<Map<String, Object>> getStatisticsByCategory(ElibStatistics elibStatistics);
	
	public int getStatisticsByBookCnt(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsByBook(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsByBookAll(ElibStatistics elibStatistics);

	public int getStatisticsByMemberCnt(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsByMember(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsByMemberAll(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsByAge(ElibStatistics elibStatistics);

	public List<ElibStatistics> getStatisticsByAgeAndCategory(ElibStatistics elibStatistics);

	public List<ElibStatistics> getStatisticsByAgeAndCategoryElearn(ElibStatistics elibStatistics);

	public List<ElibStatistics> getStatisticsByAgeAndCategoryAudio(ElibStatistics elibStatistics);

	/**
	 * 소장자료별 통계의 총합계
	 * @author YONGJU 2017. 10. 31.
	 * @param elibStatistics
	 * @return
	 */
	public ElibStatistics getStatisticsByBookTotal(ElibStatistics elibStatistics);

	/**
	 * 회원별 통계의 총 합계
	 * @author YONGJU 2017. 10. 31.
	 * @param elibStatistics
	 * @return
	 */
	public ElibStatistics getStatisticsByMemberTotal(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsSummaryList(ElibStatistics elibStatistics);
	
	public List<ElibStatistics> getStatisticsUniqueSummaryList(ElibStatistics elibStatistics);
	
	public List<Map<String, Object>> getStatisticsByCompany(ElibStatistics elibStatistics);

	public List<ElibStatistics> getStatisticsPersonalSummaryList(ElibStatistics elibStatistics);

	public List<Map<String, Object>> getStatisticsByCategoryPersonal(ElibStatistics elibStatistics);

	public List<Map<String, Object>> getStatisticsByPersonalCompany(ElibStatistics elibStatistics);

	public List<ElibStatistics> getStatisticsUniquePersonalSummaryList(ElibStatistics elibStatistics);

	public List<Map<String, Object>> getStatisticsByPersonalCompanyMain(ElibStatistics elibStatistics);
	
}
