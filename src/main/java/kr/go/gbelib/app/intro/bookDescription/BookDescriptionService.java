package kr.go.gbelib.app.intro.bookDescription;

import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class BookDescriptionService {
	
	@Autowired
	private BookDescriptionDao dao;

	@SuppressWarnings("unchecked")
	public Map<String, Object> resultDescriptionMap(Map<String,Object> result, LibrarySearch librarySearch, String resultListKey, String descriptionMapKey) {
		
		try {
			List<Object> list = (List<Object>) result.get(resultListKey);
			ObjectMapper objectMapper = new ObjectMapper();
			
			List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
			
			String description = "";
			String isbn = "";
			
			List<Map<String,Object>> naverDetailList = new ArrayList<Map<String,Object>>();
			
			if (list != null && list.size() > 0) {
				for (Object one : list) {
					Map<String, Object> map = objectMapper.convertValue(one, Map.class);
					if (StringUtils.isNotEmpty((String) map.get("ISBN"))) {
						description = dao.getDescription((String) map.get("ISBN"));
						isbn = (String) map.get("ISBN");

						if (StringUtils.isNotEmpty(description)) {
							map.put(descriptionMapKey, description);
						} else {
							try {
								naverDetailList = LibSearchAPI.getNaverDetail(isbn);
							} catch (Exception e) {
								// TODO: handle exception
								e.printStackTrace();
							}

							if (naverDetailList != null) {
								// 여러가지 책이 나오더라도 첫번째 나온 책을 찾아서 설명을 등록
								Map<String,Object> naverDetail = naverDetailList.get(0);

								if (naverDetail != null) {
									description = (String) naverDetail.get("description");

									dao.addDescription(isbn, description);
									map.put(descriptionMapKey, description);
								}
							} else {
								map.put(descriptionMapKey, "");
							}
						}
					}
					listMap.add(map);
				}
			}
			result.put(resultListKey, listMap);
			return result;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
