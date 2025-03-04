<#--
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#if (actionMessages?? && actionMessages?size > 0 && !attributes.isEmptyList)>
<div
<#if attributes.id?if_exists != "">
 id="${attributes.id}"<#rt/>
</#if>
<#if attributes.cssClass??>
 class="ui-widget ${attributes.cssClass}"<#rt/>
<#else>
 class="ui-widget actionMessage"<#rt/>
</#if>
<#if attributes.cssStyle??>
 style="${attributes.cssStyle}"<#rt/>
</#if>
>
	<div class="ui-state-highlight ui-corner-all" style="padding: 0.3em 0.7em; margin-top: 20px;">
		<#list actionMessages as message>
            <#if message?if_exists != "">
		<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: 0.3em;"></span>
		<span><#if attributes.escape>${message!}<#else>${message!}</#if></span></p>
            </#if>
		</#list>
	</div>
</div>
</#if>