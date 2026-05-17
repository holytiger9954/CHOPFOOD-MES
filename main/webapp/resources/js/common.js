// 알림
document.addEventListener("DOMContentLoaded", function () {
    const alarmBtn = document.getElementById("alarmBtn");
    const alarmPanel = document.getElementById("alarmPanel");

    if (!alarmBtn || !alarmPanel) return;

    alarmBtn.addEventListener("click", function (e) {
        e.stopPropagation();
        alarmPanel.classList.toggle("active");
    });

    alarmPanel.addEventListener("click", function (e) {
        e.stopPropagation();
    });

    document.addEventListener("click", function () {
        alarmPanel.classList.remove("active");
    });

    const closeButtons = alarmPanel.querySelectorAll(".alarm-close");

    closeButtons.forEach(function (btn) {
        btn.addEventListener("click", function () {
            btn.closest(".alarm-item").remove();
        });
    });
});

// 사이드바
document.addEventListener("DOMContentLoaded", function () {
    setSnbActiveMenu();
});

function setSnbActiveMenu() {
    const currentPath = window.location.pathname;
    const snb = document.querySelector(".snb");

    if (!snb) return;

    const menuLinks = snb.querySelectorAll(".snb-menu[href]");
    const subLinks = snb.querySelectorAll(".snb-submenu-link[href]");

    menuLinks.forEach(function (link) {
        link.classList.remove("active");
    });

    subLinks.forEach(function (link) {
        link.classList.remove("active");
    });

    let matched = false;

    subLinks.forEach(function (link) {
        const linkPath = new URL(link.href).pathname;

        if (currentPath === linkPath || currentPath.startsWith(linkPath + "/")) {
            link.classList.add("active");

            const group = link.closest(".snb-group");

            if (group) {
                group.classList.add("open");

                const parentMenu = group.querySelector(".snb-menu");

                if (parentMenu) {
                    parentMenu.classList.add("active");
                }
            }

            matched = true;
        }
    });

    if (matched) return;

    menuLinks.forEach(function (link) {
        const dataPath = link.dataset.snbPath;
        const linkPath = dataPath ? dataPath : new URL(link.href).pathname;

        if (currentPath === linkPath || currentPath.startsWith(linkPath + "/")) {
            link.classList.add("active");
        }
    });
}