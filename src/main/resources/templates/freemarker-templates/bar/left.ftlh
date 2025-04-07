<#macro leftBar userId>

    <div class="iq-sidebar  sidebar-default ">
        <div id="sidebar-scrollbar">
            <nav class="iq-sidebar-menu">
                <ul id="iq-sidebar-toggle" class="iq-menu">
                    <li class="active">
                        <a href="/start" class=" ">
                            <i class="las la-newspaper"></i><span>Newsfeed</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="/profile/${userId}" class=" ">
                            <i class="las la-user"></i><span>Profile</span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="/chats" class=" ">
                            <i class="las la-check-circle"></i><span>Messages</span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="#carbox" data-bs-toggle="collapse" class="collapsed" aria-expanded="false">
                        <i class="ri-mail-line"></i><span>Cars</span><i
                                class="ri-arrow-right-s-line iq-arrow-right"></i>
                        </a>
                        <ul id="carbox" class="iq-submenu collapse" data-bs-parent="#iq-sidebar-toggle">
                            <li class="">
                                <a href="/cars"><i class="  ri-inbox-line"></i>My cars</a>
                            </li>
                            <li class="">
                                <a href="/cars/global"><i class="ri-edit-line"></i>Find cars</a>
                            </li>
                        </ul>
                    </li>

                    <li class=" ">
                        <a href="#communitybox" data-bs-toggle="collapse" class="collapsed" aria-expanded="false">
                            <i class="ri-mail-line"></i><span>Communities</span><i
                                    class="ri-arrow-right-s-line iq-arrow-right"></i>
                        </a>
                        <ul id="communitybox" class="iq-submenu collapse" data-bs-parent="#iq-sidebar-toggle">
                            <li class="">
                                <a href="/communities"><i class="  ri-inbox-line"></i>Search</a>
                            </li>
                            <li class="">
                                <a href="/communities/${userId}"><i class="ri-edit-line"></i>Mine</a>
                            </li>
                            <li class="">
                                <a href="/community/creation"><i class="ri-edit-line"></i>Create</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="p-5"></div>
        </div>
    </div>
</#macro>