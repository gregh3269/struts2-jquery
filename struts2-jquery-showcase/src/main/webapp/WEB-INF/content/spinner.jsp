<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<script type="text/javascript" charset="UTF-8" src="<s:url value="/js/globalize.js"/>"></script>
<script type="text/javascript" charset="UTF-8" src="<s:url value="/js/globalize.culture.it.js"/>"></script>
<script type="text/javascript" charset="UTF-8">
    Globalize.culture( "it" );
</script>

<h2>Spinner</h2>

<p class="text">
	A spinner widget.
</p>

<h3>A simple Spinner</h3>
<sj:spinner name="spinner1" id="spinner1"/>
<br/>
<br/>

<h3>A spinner with max=50 and step=2 setting</h3>
<sj:spinner
		name="spinner2"
		id="spinner2"
		min="5"
		max="50"
		step="2"
		value="25"/>
<br/>
<br/>

<h3>A spinner with currency format and mouse wheel support</h3>

<sj:spinner
		name="spinner3"
		id="spinner3"
		min="0"
		max="50"
		step="2"
		value="26"
        numberFormat="C"
		mouseWheel="true"/>


<h4>Source Code</h4>

<div class="code ui-widget-content ui-corner-all">
	  <pre>
            <code class="html">

&lt;script type=&quot;text/javascript&quot; charset=&quot;UTF-8&quot; src=&quot;&lt;s:url value=&quot;/js/globalize.js&quot;/&gt;&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; charset=&quot;UTF-8&quot; src=&quot;&lt;s:url value=&quot;/js/globalize.culture.it.js&quot;/&gt;&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; charset=&quot;UTF-8&quot;&gt;
Globalize.culture( &quot;it&quot; );
&lt;/script&gt;

&lt;h3&gt;A simple Spinner&lt;/h3&gt;
&lt;sj:spinner name=&quot;spinner1&quot; id=&quot;spinner1&quot;/&gt;
&lt;br/&gt;
&lt;br/&gt;

&lt;h3&gt;A spinner with max=50 and step=2 setting&lt;/h3&gt;
&lt;sj:spinner
	name=&quot;spinner2&quot;
	id=&quot;spinner2&quot;
	min=&quot;5&quot;
	max=&quot;50&quot;
	step=&quot;2&quot;
	value=&quot;25&quot;
/&gt;
&lt;br/&gt;
&lt;br/&gt;

&lt;h3&gt;A spinner with currency format and mouse wheel support&lt;/h3&gt;

&lt;sj:spinner
	name=&quot;spinner3&quot;
	id=&quot;spinner3&quot;
	min=&quot;0&quot;
	max=&quot;50&quot;
	step=&quot;2&quot;
	value=&quot;26&quot;
	numberFormat=&quot;C&quot;
	mouseWheel=&quot;true&quot;
/&gt;
			</code>
    </pre>
</div>
