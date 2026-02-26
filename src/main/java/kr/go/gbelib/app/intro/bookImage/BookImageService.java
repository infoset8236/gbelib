package kr.go.gbelib.app.intro.bookImage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.go.gbelib.app.common.api.LibSearchAPI;
import kr.go.gbelib.app.intro.search.LibrarySearch;

@Service
public class BookImageService {
	
	@Autowired
	private BookImageDao dao;
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> resultImageMap(Map<String,Object> result, LibrarySearch librarySearch, String resultListKey, String imageMapKey) {
		
		try {
			List<Object> list = (List<Object>) result.get(resultListKey);
			ObjectMapper objectMapper = new ObjectMapper();
			
			List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
			
			String image = "";
			String isbn = "";
			
			List<Map<String,Object>> naverDetailList = new ArrayList<Map<String,Object>>();
			
			if (list != null && list.size() > 0) {
				for (Object one : list) {
					Map<String, Object> map = objectMapper.convertValue(one, Map.class);
					if ("dsResult".equals(resultListKey)) {
						if (StringUtils.isNotEmpty((String) map.get("DISP08"))) {
							String imgUrl = dao.getImage((String) map.get("DISP08"));
							isbn = (String) map.get("DISP08");
							
							if (StringUtils.isNotEmpty(imgUrl)) {
								map.put(imageMapKey, imgUrl);
							} else {
								try {
									naverDetailList = LibSearchAPI.getNaverDetail(isbn);
								} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
								}
								
								if (naverDetailList != null) {
									// 여러가지 책이 나오더라도 첫번째 나온 책을 찾아서 이미지를 등록
									Map<String,Object> naverDetail = naverDetailList.get(0);
									
									if (naverDetail != null) {
										image = (String) naverDetail.get("image");
										
										dao.addImage(isbn, image);
										map.put(imageMapKey, image);
									}
								} else {
									map.put(imageMapKey, "");
								}
							}
						}
					} else {
						if (StringUtils.isNotEmpty((String) map.get("ISBN"))) {
							String imgUrl = dao.getImage((String) map.get("ISBN"));
							isbn = (String) map.get("ISBN");
							
							if (StringUtils.isNotEmpty(imgUrl)) {
								map.put(imageMapKey, imgUrl);
							} else {
								try {
									naverDetailList = LibSearchAPI.getNaverDetail(isbn);
								} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
								}
								
								if (naverDetailList != null) {
									// 여러가지 책이 나오더라도 첫번째 나온 책을 찾아서 이미지를 등록
									Map<String,Object> naverDetail = naverDetailList.get(0);
									
									if (naverDetail != null) {
										image = (String) naverDetail.get("image");
										
										dao.addImage(isbn, image);
										map.put(imageMapKey, image);
									}
								} else {
									map.put(imageMapKey, "");
								}
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

	@SuppressWarnings("unchecked")
	public Map<String, Object> resultImageMapIsbn(Map<String, Object> result, LibrarySearch librarySearch, String resultListKey, String imageMapKey) {
		try {
			List<Object> list = (List<Object>) result.get(resultListKey);
			ObjectMapper objectMapper = new ObjectMapper();
			
			List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
			
			String image = "";
			String isbn = "";
			
			List<Map<String,Object>> naverDetailList = new ArrayList<Map<String,Object>>();
			
			if (list != null && list.size() > 0) {
				for (Object one : list) {
					Map<String, Object> map = objectMapper.convertValue(one, Map.class);
						if (StringUtils.isNotEmpty((String) map.get("isbn"))) {
							String imgUrl = dao.getImage((String) map.get("isbn"));
							isbn = (String) map.get("isbn");
							
							if (StringUtils.isNotEmpty(imgUrl)) {
								map.put(imageMapKey, imgUrl);
							} else {
								try {
									naverDetailList = LibSearchAPI.getNaverDetail(isbn);
								} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
								}
								
								if (naverDetailList != null) {
									// 여러가지 책이 나오더라도 첫번째 나온 책을 찾아서 이미지를 등록
									Map<String,Object> naverDetail = naverDetailList.get(0);
									
									if (naverDetail != null) {
										image = (String) naverDetail.get("image");
										
										dao.addImage(isbn, image);
										map.put(imageMapKey, image);
									}
								} else {
									map.put(imageMapKey, "");
								}
							}
						}
					
					
					listMap.add(map);
				}
			}
			
			result.put(resultListKey, listMap);
			
			return result;
		} catch (Exception e) {
		}
		
		return null;
	}
}
