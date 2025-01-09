<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<h2>Grid (Local Data)</h2>

<p class="text">
	A grid that loads data only once on initialization. The column credit limit is editable.
</p>
<s:url var="remoteurl" action="grid-data-provider" namespace="/grid">
	<s:param name="loadonce" value="%{true}"/>
</s:url>
<s:url var="editcellurl" action="edit-cell-entry" namespace="/grid"/>
<sjg:grid
		id="gridloadtable"
		loadonce="true"
		caption="Customers Examples (Local Data)"
		href="%{remoteurl}"
		gridModel="gridModel"
		rowNum="-1"
		hidegrid="true"
		scroll="true"
		cellEdit="true"
		cellurl="%{editcellurl}"
		altRows="true"
		sortable="true"
		sortableOpacity="0.8"
		sortablePlaceholder="ui-state-highlight"
		sortableForcePlaceholderSize="true"
		>
	<sjg:gridColumn name="id" index="id" key="true" title="ID" width="30" formatter="integer" sortable="true"
	                sorttype="int"/>
	<sjg:gridColumn name="name" index="name" title="Company" width="250" sortable="true"/>
	<sjg:gridColumn name="lastName" index="lastName" title="Last Name" sortable="true" hidden="true"/>
	<sjg:gridColumn name="firstName" index="firstName" title="First Name" sortable="true" hidden="true"/>
	<sjg:gridColumn name="addressLine1" index="addressLine1" title="Adress" sortable="true" hidden="true"/>
	<sjg:gridColumn name="country" index="country" title="Country" sortable="true"/>
	<sjg:gridColumn name="city" index="city" title="City" sortable="true"/>
	<sjg:gridColumn name="creditLimit"
	                index="creditLimit"
	                title="Credit Limit"
	                align="right"
	                editable="true"
	                editrules="{
    									number: true,
    									required: true,
    									minValue : 100.0,
    									maxValue : 10000.0
    								}"
	                formatter="currency"
	                sortable="true"
	                sorttype="currency"/>
</sjg:grid>
<br/>
<sj:a id="grid_load_colsbutton"
      onClickTopics="showloadcolumns"
      button="true">Show/Hide Columns</sj:a>

<h4>Source Code</h4>

<sj:tabbedpanel id="localtabs">
<sj:tab id="tab1" target="jsp" label="JSP"/>
<sj:tab id="tab2" target="java" label="Struts2 Action"/>
<div id="jsp">
	  <pre>
            <code class="html">
&lt;s:url var=&quot;remoteurl&quot; action=&quot;grid-data-provider&quot; namespace=&quot;/grid&quot;&gt;
  &lt;s:param name=&quot;loadonce&quot; value=&quot;%{true}&quot;/&gt;
&lt;/s:url&gt;
&lt;s:url var=&quot;editcellurl&quot; action=&quot;edit-cell-entry&quot; namespace=&quot;/grid&quot;/&gt;
&lt;sjg:grid
  id=&quot;gridloadtable&quot;
  loadonce=&quot;true&quot;
  caption=&quot;Customers Examples (Local Data)&quot;
  href=&quot;%{remoteurl}&quot;
  gridModel=&quot;gridModel&quot;
  rowNum=&quot;-1&quot;
  hidegrid=&quot;true&quot;
  scroll=&quot;true&quot;
  cellEdit=&quot;true&quot;
  cellurl=&quot;%{editcellurl}&quot;
  altRows=&quot;true&quot;
  sortable=&quot;true&quot;
  sortableOpacity=&quot;0.8&quot;
  sortablePlaceholder=&quot;ui-state-highlight&quot;
  sortableForcePlaceholderSize=&quot;true&quot;
&gt;
  &lt;sjg:gridColumn name=&quot;id&quot; index=&quot;id&quot; key=&quot;true&quot; title=&quot;ID&quot; width=&quot;30&quot; formatter=&quot;integer&quot; sortable=&quot;true&quot;
  sorttype=&quot;int&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;name&quot; index=&quot;name&quot; title=&quot;Company&quot; width=&quot;250&quot; sortable=&quot;true&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;lastName&quot; index=&quot;lastName&quot; title=&quot;Last Name&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;firstName&quot; index=&quot;firstName&quot; title=&quot;First Name&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;addressLine1&quot; index=&quot;addressLine1&quot; title=&quot;Adress&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;country&quot; index=&quot;country&quot; title=&quot;Country&quot; sortable=&quot;true&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;city&quot; index=&quot;city&quot; title=&quot;City&quot; sortable=&quot;true&quot;/&gt;
  &lt;sjg:gridColumn name=&quot;creditLimit&quot;
    index=&quot;creditLimit&quot;
    title=&quot;Credit Limit&quot;
    align=&quot;right&quot;
    editable=&quot;true&quot;
    editrules=&quot;{
    number: true,
    required: true,
    minValue : 100.0,
    maxValue : 10000.0
    }&quot;
    formatter=&quot;currency&quot;
    sortable=&quot;true&quot;
    sorttype=&quot;currency&quot;
  /&gt;
&lt;/sjg:grid&gt;
&lt;br/&gt;
&lt;sj:a  id=&quot;grid_load_colsbutton&quot;
          onClickTopics=&quot;showloadcolumns&quot;
          button=&quot;true&quot;&gt;Show/Hide Columns&lt;/sj:a&gt;
            </code>
	  </pre>
</div>
<div id="java">
      <pre>
            <code class="java">
package com.jgeppert.struts2.jquery.showcase.grid;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;

import com.jgeppert.struts2.jquery.showcase.model.Customer;
import com.jgeppert.struts2.jquery.showcase.model.CustomerDAO;
import org.apache.struts2.ActionSupport;

@Result(name = &quot;success&quot;, type = &quot;json&quot;)
public class GridDataProvider extends ActionSupport implements SessionAware {

  private static final long   serialVersionUID = 5078264277068533593L;
  private static final Log    log              = LogFactory.getLog(GridDataProvider.class);

  // Your result List
  private List&lt;Customer&gt;      gridModel;

  // get how many rows we want to have into the grid - rowNum attribute in the
  // grid
  private Integer             rows             = 0;

  // Get the requested page. By default grid sets this to 1.
  private Integer             page             = 0;

  // sorting order - asc or desc
  private String              sord;

  // get index row - i.e. user click to sort.
  private String              sidx;

  // Search Field
  private String              searchField;

  // The Search String
  private String              searchString;

  // Limit the result when using local data, value form attribute rowTotal
  private Integer             totalrows;

  // he Search Operation
  // ['eq','ne','lt','le','gt','ge','bw','bn','in','ni','ew','en','cn','nc']
  private String              searchOper;

  // Your Total Pages
  private Integer             total            = 0;

  // All Records
  private Integer             records          = 0;

  private boolean             loadonce         = false;
  private Map&lt;String, Object&gt; session;
  private List&lt;Customer&gt;      myCustomers;

  public String execute()
  {
    log.debug(&quot;Page &quot; + getPage() + &quot; Rows &quot; + getRows() + &quot; Sorting Order &quot; + getSord() + &quot; Index Row :&quot; + getSidx());
    log.debug(&quot;Search :&quot; + searchField + &quot; &quot; + searchOper + &quot; &quot; + searchString);

    Object list = session.get(&quot;mylist&quot;);
    if (list != null)
    {
      myCustomers = (List&lt;Customer&gt;) list;
    }
    else
    {
      log.debug(&quot;Build new List&quot;);
      myCustomers = CustomerDAO.buildList();
    }

    if (sord != null &amp;&amp; sord.equalsIgnoreCase(&quot;asc&quot;))
    {
      Collections.sort(myCustomers);
    }
    if (sord != null &amp;&amp; sord.equalsIgnoreCase(&quot;desc&quot;))
    {
      Collections.sort(myCustomers);
      Collections.reverse(myCustomers);
    }

    // Count all record (select count(*) from your_custumers)
    records = CustomerDAO.getCustomersCount(myCustomers);

    if (totalrows != null)
    {
      records = totalrows;
    }

    // Calucalate until rows ware selected
    int to = (rows * page);

    // Calculate the first row to read
    int from = to - rows;

    // Set to = max rows
    if (to &gt; records) to = records;

    if (loadonce)
    {
      if (totalrows != null &amp;&amp; totalrows &gt; 0)
      {
        setGridModel(myCustomers.subList(0, totalrows));
      }
      else
      {
        // All Custumer
        setGridModel(myCustomers);
      }
    }
    else
    {
      // Search Custumers
      if (searchString != null &amp;&amp; searchOper != null)
      {
        int id = Integer.parseInt(searchString);
        if (searchOper.equalsIgnoreCase(&quot;eq&quot;))
        {
          log.debug(&quot;search id equals &quot; + id);
          List&lt;Customer&gt; cList = new ArrayList&lt;Customer&gt;();
          Customer customer = CustomerDAO.findById(myCustomers, id);

          if (customer != null) cList.add(customer);

          setGridModel(cList);
        }
        else if (searchOper.equalsIgnoreCase(&quot;ne&quot;))
        {
          log.debug(&quot;search id not &quot; + id);
          setGridModel(CustomerDAO.findNotById(myCustomers, id, from, to));
        }
        else if (searchOper.equalsIgnoreCase(&quot;lt&quot;))
        {
          log.debug(&quot;search id lesser then &quot; + id);
          setGridModel(CustomerDAO.findLesserAsId(myCustomers, id, from, to));
        }
        else if (searchOper.equalsIgnoreCase(&quot;gt&quot;))
        {
          log.debug(&quot;search id greater then &quot; + id);
          setGridModel(CustomerDAO.findGreaterAsId(myCustomers, id, from, to));
        }
      }
      else
      {
        setGridModel(CustomerDAO.getCustomers(myCustomers, from, to));
      }
    }

    // Calculate total Pages
    total = (int) Math.ceil((double) records / (double) rows);

    // only for showcase functionality, don't do this in production
    session.put(&quot;mylist&quot;, myCustomers);

    return SUCCESS;
  }

  public String getJSON()
  {
    return execute();
  }

  /**
   * @return how many rows we want to have into the grid
   */
  public Integer getRows()
  {
    return rows;
  }

  /**
   * @param rows
   *          how many rows we want to have into the grid
   */
  public void setRows(Integer rows)
  {
    this.rows = rows;
  }

  /**
   * @return current page of the query
   */
  public Integer getPage()
  {
    return page;
  }

  /**
   * @param page
   *          current page of the query
   */
  public void setPage(Integer page)
  {
    this.page = page;
  }

  /**
   * @return total pages for the query
   */
  public Integer getTotal()
  {
    return total;
  }

  /**
   * @param total
   *          total pages for the query
   */
  public void setTotal(Integer total)
  {
    this.total = total;
  }

  /**
   * @return total number of records for the query. e.g. select count(*) from
   *         table
   */
  public Integer getRecords()
  {
    return records;
  }

  /**
   * @param record
   *          total number of records for the query. e.g. select count(*) from
   *          table
   */
  public void setRecords(Integer records)
  {

    this.records = records;

    if (this.records &gt; 0 &amp;&amp; this.rows &gt; 0)
    {
      this.total = (int) Math.ceil((double) this.records / (double) this.rows);
    }
    else
    {
      this.total = 0;
    }
  }

  /**
   * @return an collection that contains the actual data
   */
  public List&lt;Customer&gt; getGridModel()
  {
    return gridModel;
  }

  /**
   * @param gridModel
   *          an collection that contains the actual data
   */
  public void setGridModel(List&lt;Customer&gt; gridModel)
  {
    this.gridModel = gridModel;
  }

  /**
   * @return sorting order
   */
  public String getSord()
  {
    return sord;
  }

  /**
   * @param sord
   *          sorting order
   */
  public void setSord(String sord)
  {
    this.sord = sord;
  }

  /**
   * @return get index row - i.e. user click to sort.
   */
  public String getSidx()
  {
    return sidx;
  }

  /**
   * @param sidx
   *          get index row - i.e. user click to sort.
   */
  public void setSidx(String sidx)
  {
    this.sidx = sidx;
  }

  public void setSearchField(String searchField)
  {
    this.searchField = searchField;
  }

  public void setSearchString(String searchString)
  {
    this.searchString = searchString;
  }

  public void setSearchOper(String searchOper)
  {
    this.searchOper = searchOper;
  }

  public void setLoadonce(boolean loadonce)
  {
    this.loadonce = loadonce;
  }

  public void setSession(Map&lt;String, Object&gt; session)
  {
    this.session = session;
  }

  public void setTotalrows(Integer totalrows)
  {
    this.totalrows = totalrows;
  }

}

            </code>
	  </pre>
</div>
</sj:tabbedpanel>

