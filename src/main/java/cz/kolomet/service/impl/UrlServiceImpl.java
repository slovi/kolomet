package cz.kolomet.service.impl;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.conn.ssl.AllowAllHostnameVerifier;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cz.kolomet.dto.UrlShortRequestDto;
import cz.kolomet.dto.UrlShortResponseDto;
import cz.kolomet.service.UrlService;
import cz.kolomet.util.json.JsonSerializer;

@Service
@SuppressWarnings("deprecation")
public class UrlServiceImpl implements UrlService {
	
	private String apiKey = "AIzaSyAbbZrV_w_DmKzCVuFSxgkBs4pvi1gk1VA";
	
	private CloseableHttpClient client = HttpClients.custom().setHostnameVerifier(new AllowAllHostnameVerifier()).build();
	
	@Autowired
	private JsonSerializer serializer;

	@Override
	public String shortUrl(String url) {

		Header header = new BasicHeader(HttpHeaders.CONTENT_TYPE, "application/json");
		
		UrlShortRequestDto requestDto = new UrlShortRequestDto();
		requestDto.setLongUrl(url);
		HttpEntity entity = new StringEntity(serializer.toJson(requestDto), "UTF-8"); 
		
		HttpUriRequest request = RequestBuilder
				.post("https://www.googleapis.com/urlshortener/v1/url?key=" + apiKey)
				.setEntity(entity)
				.setHeader(header).build();

		try {
			CloseableHttpResponse response = client.execute(request);
			HttpEntity responseEntity = response.getEntity();
			UrlShortResponseDto responseDto = serializer.toObject(responseEntity.getContent(), UrlShortResponseDto.class);
			return responseDto.getId();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public CloseableHttpClient getClient() {
		return client;
	}

	public void setClient(CloseableHttpClient client) {
		this.client = client;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public JsonSerializer getSerializer() {
		return serializer;
	}

	public void setSerializer(JsonSerializer serializer) {
		this.serializer = serializer;
	}

}
