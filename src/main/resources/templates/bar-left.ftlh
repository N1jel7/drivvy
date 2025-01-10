<#macro leftBar userId>

    <div class="iq-sidebar  sidebar-default ">
        <div id="sidebar-scrollbar">
            <nav class="iq-sidebar-menu">
                <ul id="iq-sidebar-toggle" class="iq-menu">
                    <li class="active">
                        <a href="/" class=" ">
                            <i class="las la-newspaper"></i><span>Newsfeed</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="/" class=" ">
                            <i class="las la-user"></i><span>Profile</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="/" class=" ">
                            <i class="las la-users"></i><span>Group</span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="/dialogues" class=" ">
                            <i class="las la-check-circle"></i><span>Messages</span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="/cars" data-bs-toggle="collapse" class="  collapsed" aria-expanded="false">
                            <i class="ri-mail-line"></i><span>Cars</span><i
                                    class="ri-arrow-right-s-line iq-arrow-right"></i>
                        </a>
                        <ul id="mailbox" class="iq-submenu collapse" data-bs-parent="#iq-sidebar-toggle">
                            <li class="">
                                <a href="/${userId}/cars"><i class="  ri-inbox-line"></i>My cars</a>
                            </li>
                            <li class="">
                                <a href="/cars"><i class="ri-edit-line"></i>Find cars</a>
                            </li>
                        </ul>
                    </li>7
                </ul>
            </nav>
            <div class="p-5"></div>
        </div>
    </div>
</#macro>