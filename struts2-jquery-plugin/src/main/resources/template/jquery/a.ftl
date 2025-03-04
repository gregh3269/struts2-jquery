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
<a<#rt/>
<#if attributes.id?if_exists != "">
 id="${attributes.id}"<#rt/>
</#if>
<#if attributes.href?if_exists != "">
 href="javascript:void(0)"<#rt/>
</#if>
<#if attributes.tabindex??>
 tabindex="${attributes.tabindex}"<#rt/>
</#if>
<#if attributes.cssClass??>
 class="${attributes.cssClass}"<#rt/>
</#if>
<#if attributes.cssStyle??>
 style="${attributes.cssStyle}"<#rt/>
</#if>
<#if attributes.title??>
 title="${attributes.title}"<#rt/>
</#if>
<#if attributes.disabled?default(false)>
 disabled="disabled"<#rt/>
</#if>
<#include "/${attributes.templateDir}/simple/scripting-events.ftl" />
<#include "/${attributes.templateDir}/simple/common-attributes.ftl" />
<#include "/${attributes.templateDir}/simple/dynamic-attributes.ftl" />
>