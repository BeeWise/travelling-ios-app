//
//  PlaceCommentsViewController+TableViewDelegate.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/10/2020.
//

import Foundation
import UIKit

extension PlaceCommentsViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.shouldLoadMoreBeforeReaching(threshold: 50) {
            
        }
    }
        
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if self.sections[section].isLoading {
            return self.loadingHeaderFooterView(tableView: tableView, isLoading: self.sections[section].isLoading)
        } else if self.sections[section].hasError {
            return self.errorHeaderFooterView(tableView: tableView, title: self.sections[section].errorText)
        } else if self.sections[section].noMoreItems {
            return self.titleHeaderFooterView(tableView: tableView, title: self.sections[section].noMoreItemsText)
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if self.sections[section].isLoading {
            return UITableView.automaticDimension
        } else if self.sections[section].hasError {
            return UITableView.automaticDimension
        } else if self.sections[section].noMoreItems {
            return UITableView.automaticDimension
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        switch section {
            case PlaceCommentsModels.SectionIndex.items.rawValue: return PlaceCommentsStyle.shared.tableViewModel.itemsSectionFooterHeight
            case PlaceCommentsModels.SectionIndex.footer.rawValue: return PlaceCommentsStyle.shared.tableViewModel.footerSectionFooterHeight
            default: return CGFloat.leastNonzeroMagnitude
        }
    }
    
    private func loadingHeaderFooterView(tableView: UITableView, isLoading: Bool) -> TableViewLoadingHeaderFooterView {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewLoadingHeaderFooterView.defaultReuseIdentifier) as? TableViewLoadingHeaderFooterView ?? TableViewLoadingHeaderFooterView()
        view.setColor(color: PlaceCommentsStyle.shared.tableViewModel.activityIndicatorColor)
        view.setIsLoading(isLoading: isLoading)
        return view
    }
    
    private func titleHeaderFooterView(tableView: UITableView, title: NSAttributedString?) -> TableViewTitleHeaderFooterView {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewTitleHeaderFooterView.defaultReuseIdentifier) as? TableViewTitleHeaderFooterView ?? TableViewTitleHeaderFooterView()
        view.setTitle(title: title)
        return view
    }
    
    private func errorHeaderFooterView(tableView: UITableView, title: NSAttributedString?) -> TableViewErrorHeaderFooterView {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewErrorHeaderFooterView.defaultReuseIdentifier) as? TableViewErrorHeaderFooterView ?? TableViewErrorHeaderFooterView()
        view.setTitle(title: title)
        view.delegate = self
        return view
    }
}

extension PlaceCommentsViewController: TableViewErrorHeaderFooterViewDelegate {
    func tableViewErrorHeaderFooterView(view: TableViewErrorHeaderFooterView?, didSelectTitle button: UIButton?) {
        
    }
}
