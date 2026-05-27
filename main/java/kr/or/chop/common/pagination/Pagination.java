package kr.or.chop.common.pagination;

public class Pagination {

    public static PageInfo getPageInfo(
            int listCount,
            int currentPage,
            int pageLimit,
            int boardLimit) {

        int maxPage = (int)Math.ceil((double)listCount / boardLimit);

        if (maxPage == 0) {
            maxPage = 1;
        }

        if (currentPage < 1) {
            currentPage = 1;
        }

        if (currentPage > maxPage) {
            currentPage = maxPage;
        }

        int half = pageLimit / 2;

        int startPage = currentPage - half;
        int endPage = currentPage + half;

        if (pageLimit % 2 == 0) {
            endPage = currentPage + half - 1;
        }

        if (startPage < 1) {
            startPage = 1;
            endPage = pageLimit;
        }

        if (endPage > maxPage) {
            endPage = maxPage;
            startPage = maxPage - pageLimit + 1;
        }

        if (startPage < 1) {
            startPage = 1;
        }

        int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = currentPage * boardLimit;

        return new PageInfo(
                currentPage,
                listCount,
                pageLimit,
                boardLimit,
                maxPage,
                startPage,
                endPage,
                startRow,
                endRow
        );
    }
}