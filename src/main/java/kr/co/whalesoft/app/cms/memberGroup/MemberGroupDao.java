package kr.co.whalesoft.app.cms.memberGroup;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CMS 전용
 * 접근제어자 사용하지 않음.
 * @author YONGJU
 *
 */
public interface MemberGroupDao {

	List<MemberGroup> getMemberGroupList(MemberGroup memberGroup);

	MemberGroup getMemberGroupOne(MemberGroup memberGroup);

	int addMemberGroup(MemberGroup memberGroup);

	int modifyMemberGroup(MemberGroup memberGroup);

	int getMemberGroupCount(MemberGroup memberGroup);

	int deleteMemberGroup(MemberGroup memberGroup);

	int deleteMemberGroupRelation(MemberGroup memberGroup);

	int addMemberGroupRelation(MemberGroup memberGroup);

	List<Integer> getMemberGroupRelation(MemberGroup memberGroupOne);

	MemberGroup getSiteUserGroupOne(MemberGroup memberGroup);

	String getMemberGroupAuth(@Param("memberGroupIdxList") List<Integer> memberGroupIdxList);
}
