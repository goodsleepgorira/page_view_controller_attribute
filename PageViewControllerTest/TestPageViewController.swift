//
//  TestPageViewController.swift
//

import UIKit

class TestPageViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    let idList = ["Sea", "Morning", "Evening", "Night"]

    //最初からあるメソッド
    override func viewDidLoad() {

        //最初のビューコントローラーを取得する。
        let controller = storyboard!.instantiateViewControllerWithIdentifier(idList.first!)
        
        //ビューコントローラーを表示する。
        self.setViewControllers([controller], direction: .Forward, animated: true, completion:nil)

        //データ提供元に自分を設定する。
        self.dataSource = self
        
    }


    
    //右ドラッグ時の呼び出しメソッド
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        //現在のビューコントローラーのインデックス番号を取得する。
        let index = idList.indexOf(viewController.restorationIdentifier!)!
        if (index > 0) {
            //前ページのビューコントローラーを返す。
            return storyboard!.instantiateViewControllerWithIdentifier(idList[index-1])
        }
        return nil
    }

    
    
    //左ドラッグ時の呼び出しメソッド
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        //現在のビューコントローラーのインデックス番号を取得する。
        let index = idList.indexOf(viewController.restorationIdentifier!)!
        if (index < idList.count-1) {
            //次ページのビューコントローラーを返す。
            return storyboard!.instantiateViewControllerWithIdentifier(idList[index+1])
        }
        return nil
    }
    
    
    //全ページ数を返すメソッド
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return idList.count
    }

    //初期表示のページのインデックス番号
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
