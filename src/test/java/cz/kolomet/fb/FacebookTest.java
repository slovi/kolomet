package cz.kolomet.fb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.FacebookLink;
import org.springframework.social.facebook.api.FeedOperations;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.social.facebook.api.PostData;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:META-INF/spring/applicationContext-facebook.xml"})
public class FacebookTest {
	
	@Autowired
	private FacebookTemplate facebookTemplate;
	
	@Test
	public void testConnect() {
		
		FeedOperations feedsOperations = facebookTemplate.feedOperations();
		PagedList<Post> feedPagedList = feedsOperations.getFeed("encode.cz");
		
		for (Post post: feedPagedList) {
			System.out.println(post.getCaption() + " " + post.getDescription() + " " + post.getLink() + " "
				+ post.getId() + " " + post.getMessage() + " " + post.getIcon() + " " + post.getPicture());
		}
		
		FacebookLink facebookLink = new FacebookLink("http://www.kolomet.cz/tour/public/places", "Ahoooj", "Ahoooj", "Ahoooj");
		feedsOperations.postLink("encode.cz", "ahoj, hello world", facebookLink);
		//feedsOperations.post("encode.cz", "Test post");
		
	}

}
