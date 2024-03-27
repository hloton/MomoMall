function toggleNav(navId, show) {
    var navElement = document.getElementById(navId);
    if (show) {
        navElement.style.visibility = 'visible';
        navElement.style.opacity = '1';
    } else {
        navElement.style.opacity = '0';
        setTimeout(() => {
            navElement.style.visibility = 'hidden';
        }, 300); // 300毫秒与过渡效果时间相同
    }
}
 // 有子菜单的项（包括菜单项和子菜单列表）
 let subMenus = document.querySelectorAll('.menus-submenu')
 // 菜单项的 上/下 箭头
 let subMenusItemIcon = document.querySelectorAll('.menus-submenu .menus-item > .iconfont')
 // 菜单项X
 let subMenusItems = document.querySelectorAll('.menus-submenu > .menus-item')
 // 子菜单列表
 let subMenusList = document.querySelectorAll('.menus-submenu > .menus-list')
 // 没有子菜单的项
 let noSubMenusItems = document.querySelectorAll('.menus-nosubmenu')
 // 当前展开的菜单项索引
 let expandedIndex = 0
 // 当前选择的 子菜单项 的 父菜单项 索引
 let selectedParentIndex = 0
 // 当前选择的子菜单项索引
 let selectedSubIndex = 0
 // 当前选择的 没有子菜单的项 的索引
 let selectedNoIndex = -1

 function closeExpanded(index) {
     // 关闭展开
     subMenusItemIcon[index].classList.remove('iconshang')
     subMenusItemIcon[index].classList.add('iconxia')
     subMenus[index].classList.remove('expanded-list')
 }
 function clearSelected() {
     // 清除选中项
     // 选中项有子菜单时
     if ( -1 != selectedParentIndex ) {
         subMenusList[selectedParentIndex].getElementsByTagName('li')[selectedSubIndex].classList.remove('selected-items')
         subMenus[selectedParentIndex].classList.remove('selected-items')
     }
     // 选中项没有子菜单时
     else {
         noSubMenusItems[selectedNoIndex].classList.remove('selected-items')
     }
 }

 function initListeners() {
     // 点击响应：菜单项展开
     for (let index = 0; index < subMenusItems.length; index++) {
         subMenusItems[index].addEventListener('click', function(e) {
             // 当前点击的没有展开 并且 存在展开的, 关闭当前展开的
             if ( index != expandedIndex && -1 != expandedIndex) {
                 closeExpanded(expandedIndex)
             }
             subMenusItemIcon[index].classList.toggle('iconshang')
             subMenusItemIcon[index].classList.toggle('iconxia')

             // 判断点击的是否已经展开
             if ( !subMenus[index].classList.toggle('expanded-list')) {
                 // 点击的就是展开的，关闭展开
                 expandedIndex = -1
                 // 选中的项 是否是当前点击的子项
                 if(index == selectedParentIndex) {
                     subMenus[index].classList.add("selected-items")
                 }
             }
             else {
                 // 点击的是其他
                 expandedIndex = index
                 // 选中的项 是否是当前点击的子项
                 if(index == selectedParentIndex) {
                     subMenus[selectedParentIndex].classList.remove("selected-items")
                 }
                 else if( -1 != selectedParentIndex) {
                     subMenus[selectedParentIndex].classList.add("selected-items")
                 }
             }
         })
     }
     // 点击响应：子菜单项选中
     for (let index = 0; index < subMenusList.length; index++) {
         let subMenuLi = subMenusList[index].getElementsByTagName('li')
         for (let j = 0; j < subMenuLi.length; j++) {
             subMenuLi[j].addEventListener('click', function(e) {
                 if ( !subMenuLi[j].classList.contains('selected-items')) {
                     // 清除选择
                     clearSelected()

                     subMenuLi[j].classList.add('selected-items')
                     selectedParentIndex = index
                     selectedSubIndex = j
                 }
             })                    
         }
     }
     // 点击响应：无二级菜单的菜单项选中
     for (let index = 0; index < noSubMenusItems.length; index++) {
         noSubMenusItems[index].addEventListener("click", function(e){
             if ( !this.classList.contains('selected-items') ) {
                 // 清除选择
                 clearSelected()
                 // 如果有展开，关闭展开
                 if( -1 != expandedIndex && subMenus[expandedIndex].classList.contains('expanded-list')) {
                     closeExpanded(expandedIndex)
                 }
                 this.classList.add('selected-items')
                 selectedNoIndex = index
                 selectedParentIndex = -1
             }
         })      
     }
 }

 initListeners()