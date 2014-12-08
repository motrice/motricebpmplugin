package org.motrice.bpm.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoDocument;
import org.hippoecm.hst.content.beans.standard.HippoHtml;

@Node(jcrType = "motricebpmplugin:motricedocument")
public class MotriceDocument extends MotriceBaseDocument {
    
	public static final String TITLE = "motricebpmplugin:title";
    public static final String SUMMARY = "motricebpmplugin:summary";
    public static final String BODY = "motricebpmplugin:body";
 
    
    public String getTitle() {
        return getProperty(TITLE);
    }

    public HippoHtml getBody() {
        return getHippoHtml(BODY);
    }

    public String getSummary() {
        return getProperty(SUMMARY);
    }

}
